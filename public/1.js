$.post();


$.post("http://114.55.165.157:5888/site?action=DelDomain",{
    id: 2,
    webname: 'y6.n.zybao168.cn',
    domain: 'y83.n.zybao168.cn',
    port: 80
},function(result){
    console.log(result)
});