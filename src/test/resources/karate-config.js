function fn(){

    var config = { //base config JSON
        //urlServeur: 'https://restful-booker.herokuapp.com/',
        urlXray:'https://xray.cloud.getxray.app/api/v1/authenticate',
        //book: 'booking/',
        //posts: 'posts',
        //index: 1,
        client_id:'C4BE981A15C34E88B945C167D3F50906',
        client_secret:'7aca388c64b6023a5b250f2a36e0f741fdf789d510885c8cc6c5f39eaa4ef05c'

        };

        karate.configure('connectTimeout',5000);
        karate.configure('readTimeout',5000);
        karate.configure('ssl', { trustAll: true });

        return config;

}