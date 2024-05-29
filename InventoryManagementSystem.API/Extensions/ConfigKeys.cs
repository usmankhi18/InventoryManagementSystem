using Common.Security;
using Global.AppSettings;

namespace InventoryManagementSystem.API.Extensions
{
    public static partial class ConfigKeys
    {
        public static void LoadKeys(this IServiceCollection services, IConfiguration configuration)
        {
            AppSettingKeys.EncryptionKey = configuration["EncryptionKey"];
            AppSettingKeys.ConnType = configuration["ConnType"];
            AppSettingKeys.RedisConnectionString = AESCryptoProvider.DecryptUsingCustomKey(AppSettingKeys.EncryptionKey, configuration["RedisConnectionString"], true);
            AppSettingKeys.RedisKey = AESCryptoProvider.DecryptUsingCustomKey(AppSettingKeys.EncryptionKey, configuration["RedisKey"], true);
            AppSettingKeys.SQLServerConnection = AESCryptoProvider.DecryptUsingCustomKey(AppSettingKeys.EncryptionKey, configuration["SQLServerConnection"], true);
        }

    }
}
