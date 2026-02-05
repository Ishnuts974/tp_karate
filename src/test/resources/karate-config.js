function fn(){

    var config = { //base config JSON
        urlServeur: 'https://jsonplaceholder.typicode.com',
        var2: 'valeur2',
        var3: 'valeur3'
        };

        karate.configure('connectTimeout',5000);
        karate.configure('readTimeout',5000);
        karate.configure('ssl', { trustAll: true });

        return config;

}