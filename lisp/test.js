function add() {
    var a =1;
    var b=2;
    var c = a+b;
}

var obj = {
    add: function () {
	var a =1;
	var b=2;
	var c = a+b;
    },

    fun1: async function(){
	this.add(); // em 提取方法 
    },
    fun2: async function(){
	add();  // ef 提取函数	
    } ,
    fun3: async function(){

	
    } 
};
