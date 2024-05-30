using InventoryManagement.Application.Interfaces;
using InventoryManagement.Application;
using InventoryManagement.Domain.Interfaces;
using NLog.Web;
using InventoryManagement.Infrastructure;
using InventoryManagement.Infrastructure.Repositories;
using InventoryManagementSystem.API.Extensions;
using Global.AppSettings;
using InventoryManagement.Application.ApplicationCache;
using System.Net.Mail;
using InventoryManagement.Infrastructure.HttpClients;
using InventoryManagement.Infrastructure.Configurations;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.LoadKeys(builder.Configuration);
builder.Services.AddSingleton(new Common.Cache.RedisCacheManager(AppSettingKeys.RedisConnectionString));
builder.Services.AddSingleton<ManufacturerCache>();
builder.Services.AddSingleton<ProductsCache>();
builder.Services.Configure<ServiceUrls>(builder.Configuration.GetSection("ServiceUrls"));
builder.Services.Configure<ServiceHeaders>(builder.Configuration.GetSection("ServiceHeaders"));
builder.Services.AddHttpClient<IRestClient, RestClient>();
builder.Services.AddHttpClient<ISoapClient, SoapClient>();
builder.Services.AddScoped<IDatabaseContext>(provider => new ApplicationDbContext(AppSettingKeys.SQLServerConnection));

builder.Services.AddScoped<IManufacturerRepository, ManufacturerRepository>();
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ICommonService, CommonService>();
builder.Services.AddScoped<IManufacturerService, ManufacturerService>();
builder.Services.AddScoped<IProductService, ProductService>();

var logger = NLogBuilder.ConfigureNLog("nlog.config").GetCurrentClassLogger();
builder.Logging.ClearProviders();
builder.Host.UseNLog();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
