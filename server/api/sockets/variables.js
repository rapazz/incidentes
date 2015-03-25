
// counter.js
var clients = module.exports = {
    add: function(user,socket) {
        clients.count += 10;
         clients[user]  = socket;
    
    },
    remove: function(user) {
        var index = clients.indexOf(user);
        if (index > -1) {
    clients.splice(index, 1);
}
    },
    show:function(user){
     return clients[user] ;  
    }
}