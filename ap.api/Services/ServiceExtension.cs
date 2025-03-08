using ap.dbc.Execute;
using ap.infra.IServices;
using ap.infra.IServices.Settings;
using ap.infra.IServices.Users;
using ap.infra.Services;
using ap.infra.Services.Settings;
using ap.infra.Services.Users;

namespace ap.api.Services
{
    public static class ServiceExtension
    {
        public static IServiceCollection AddDataServices(this IServiceCollection services, IConfiguration configuration)
        {
            //System
            services.AddScoped<RawSql>();
            services.AddScoped<IConnectionService, ConnectionService>();

            //Users
            services.AddScoped<IUsersService, UsersService>();
            //Settings
            services.AddScoped<IRoleService, RoleService>();

            return services;
        }
    }
}



//|:---------:|:------------------------------------------:|:----------------------------------------------------:|:------------------------------------:|
//| Parameter | Add Singleton                              | Add Scoped                                           | Add Transient                        |
//|:---------:|:------------------------------------------:|:----------------------------------------------------:|:------------------------------------:|
//| Instance  | Same for each request/ each user.          | One per request.                                     | Different for every time.            |
//| Disposed  | App shutdown                               | End of request                                       | End of request                       |
//| Used in   | When Singleton implementation is required. | Applications that have different behavior per user.  | Lightweight and stateless services.  |
//|:---------:|:------------------------------------------:|:----------------------------------------------------:|:------------------------------------:|