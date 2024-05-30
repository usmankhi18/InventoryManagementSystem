using Microsoft.Extensions.Caching.Distributed;
using Newtonsoft.Json;
using StackExchange.Redis;

namespace Common.Cache
{
    public class RedisCacheManager
    {
        private readonly ConnectionMultiplexer _redis;
        private readonly IDatabase _db;

        public RedisCacheManager(string connectionString)
        {
            if (string.IsNullOrWhiteSpace(connectionString))
            {
                throw new ArgumentException("Redis connection string cannot be null or empty.", nameof(connectionString));
            }

            _redis = ConnectionMultiplexer.Connect(connectionString);
            _db = _redis.GetDatabase();
        }

        public async Task<bool> AddToSetAsync(string key, string value)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.SetAddAsync(key, value);
        }

        public async Task<bool> RemoveFromSetAsync(string key, string value)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.SetRemoveAsync(key, value);
        }

        public async Task<IEnumerable<string>> GetSetMembersAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var setValues = await _db.SetMembersAsync(key);
            var values = new List<string>();
            foreach (var value in setValues)
            {
                values.Add(value);
            }

            return values;
        }

        public async Task<bool> AddToSortedSetAsync(string key, string value, double score)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.SortedSetAddAsync(key, value, score);
        }

        public async Task<bool> RemoveFromSortedSetAsync(string key, string value)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.SortedSetRemoveAsync(key, value);
        }

        public async Task<IEnumerable<string>> GetSortedSetMembersAsync(string key, long startRank = 0, long stopRank = -1, Order order = Order.Ascending)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var setValues = await _db.SortedSetRangeByRankAsync(key, startRank, stopRank, order);
            var values = new List<string>();
            foreach (var value in setValues)
            {
                values.Add(value);
            }

            return values;
        }

        public async Task<bool> DeleteKeyAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.KeyDeleteAsync(key);
        }

        public async Task<TimeSpan?> GetKeyTimeToLiveAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.KeyTimeToLiveAsync(key);
        }

        public async Task<bool> SetStringAsync(string key, string value, TimeSpan? expiry = null)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.StringSetAsync(key, value, expiry);
        }

        public async Task<string> GetStringAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.StringGetAsync(key);
        }

        public async Task<bool> KeyExistsAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.KeyExistsAsync(key);
        }

        public async Task<bool> RemoveKeyAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.KeyDeleteAsync(key);
        }

        public async Task<long> IncrementAsync(string key, long value = 1)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.StringIncrementAsync(key, value);
        }

        public async Task<long> DecrementAsync(string key, long value = 1)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.StringDecrementAsync(key, value);
        }

        public async Task<bool> SetHashAsync(string key, IDictionary<string, string> values)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var hashEntries = new HashEntry[values.Count];
            var i = 0;
            foreach (var kvp in values)
            {
                hashEntries[i] = new HashEntry(kvp.Key, kvp.Value);
                i++;
            }

            // Execute HashSetAsync
            await _db.HashSetAsync(key, hashEntries);

            // Check if the operation was successful by checking if the key exists after setting the hash
            return await _db.KeyExistsAsync(key);
        }


        public async Task<IDictionary<string, string>> GetHashAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var hashEntries = await _db.HashGetAllAsync(key);
            var dictionary = new Dictionary<string, string>();
            foreach (var hashEntry in hashEntries)
            {
                dictionary[hashEntry.Name] = hashEntry.Value;
            }

            return dictionary;
        }

        public async Task<bool> SetListAsync(string key, IEnumerable<string> values)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var redisValues = new List<RedisValue>();
            foreach (var value in values)
            {
                redisValues.Add(value);
            }

            return await _db.ListRightPushAsync(key, redisValues.ToArray()) > 0;
        }

        public async Task<IEnumerable<string>> GetListAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var listValues = await _db.ListRangeAsync(key);
            var values = new List<string>();
            foreach (var value in listValues)
            {
                values.Add(value.ToString());
            }

            return values;
        }

        public async Task<bool> SetSetAsync(string key, IEnumerable<string> values)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var redisValues = new List<RedisValue>();
            foreach (var value in values)
            {
                redisValues.Add(value);
            }

            return await _db.SetAddAsync(key, redisValues.ToArray()) > 0;
        }

        public async Task<IEnumerable<string>> GetSetAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var setValues = await _db.SetMembersAsync(key);
            var values = new List<string>();
            foreach (var value in setValues)
            {
                values.Add(value.ToString());
            }

            return values;
        }

        public async Task<bool> SetSortedSetAsync(string key, IDictionary<string, double> values)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var redisValues = new List<SortedSetEntry>();
            foreach (var kvp in values)
            {
                redisValues.Add(new SortedSetEntry(kvp.Key, kvp.Value));
            }

            return await _db.SortedSetAddAsync(key, redisValues.ToArray()) > 0;
        }

        public async Task<IDictionary<string, double>> GetSortedSetAsync(string key)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            var setValues = await _db.SortedSetRangeByRankWithScoresAsync(key);
            var values = new Dictionary<string, double>();
            foreach (var value in setValues)
            {
                values[value.Element.ToString()] = value.Score;
            }

            return values;
        }

        public async Task<bool> ExpireAsync(string key, TimeSpan expiry)
        {
            if (string.IsNullOrWhiteSpace(key))
            {
                throw new ArgumentException("Key cannot be null or empty.", nameof(key));
            }

            return await _db.KeyExpireAsync(key, expiry);
        }

        public void SaveDataToCache<T>(string key, T data, TimeSpan? expirationTime = null)
        {
            string jsonData = JsonConvert.SerializeObject(data);
            byte[] serializedData = System.Text.Encoding.UTF8.GetBytes(jsonData);

            DistributedCacheEntryOptions cacheOptions = new DistributedCacheEntryOptions();
            if (expirationTime.HasValue)
                cacheOptions.SetSlidingExpiration(expirationTime.Value);

            _db.StringSet(key, serializedData, cacheOptions.AbsoluteExpirationRelativeToNow);
        }

        public T GetDataFromCache<T>(string key)
        {
            byte[] serializedData = _db.StringGet(key);

            if (serializedData == null)
                return default(T);

            string jsonData = System.Text.Encoding.UTF8.GetString(serializedData);
            T data = JsonConvert.DeserializeObject<T>(jsonData);

            return data;
        }

    }
}