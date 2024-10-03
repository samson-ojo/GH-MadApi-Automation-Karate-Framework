function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    
    apiUrl: 'https://conduit-api.bondaracademy.com/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'samsonkarate@mail.com'
    config.userPassword = 'SamsonKarate'
  } if (env == 'qa') {
    // customize
  }

 //var accessToken = karate.callSingle('classpath:Helpers/CreateToken.feature', config).authToken
 // karate.configure('headers', {Authorization: 'Token ' + accessToken})


  return config;
}