using Microsoft.EntityFrameworkCore;
using OscarPartyAPI;
using OscarPartyAPI.Repositories;
using OscarPartyAPI.Services;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddSingleton<string>(builder.Configuration.GetConnectionString("DefaultConnection"));

builder.Services.AddScoped<IOscarPartyRepository, OscarPartyRepository>();
builder.Services.AddScoped<IOscarPartyService, OscarPartyService>();

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var origins = "_myAllowOrigins";

builder.Services.AddCors(options =>
{
    options.AddPolicy(
        name: origins,
        policy =>
        {
            policy.WithOrigins(
                "http://localhost:7118",
                "https://localhost:7118",
                "https://crab-heroic-gorilla.ngrok-free.app"
            )
            .AllowAnyHeader()
            .AllowAnyMethod();
        }
     );
});

var app = builder.Build();

app.UseDeveloperExceptionPage();
app.UseSwagger();
app.UseSwaggerUI();

app.UseStaticFiles();

app.UseHttpsRedirection();

app.UseRouting();

app.UseCors(origins);
app.MapControllers();

app.MapFallbackToFile("index.html");

app.Run();
