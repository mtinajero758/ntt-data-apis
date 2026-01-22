function fn() {
    var env = karate.env; // obtener variable de entorno
    if (!env) {
        env = 'dev';
    }
    var config = {
        baseUrl: 'https://petstore.swagger.io/v2'
    };

    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}