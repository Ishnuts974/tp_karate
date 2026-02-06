function fn(){

    var config = { //base config JSON
        urlServeur: 'https://jsonplaceholder.typicode.com',
        users: 'users',
        posts: 'posts/1'
        };

        karate.configure('connectTimeout',5000);
        karate.configure('readTimeout',5000);
        karate.configure('ssl', { trustAll: true });

        return config;

}