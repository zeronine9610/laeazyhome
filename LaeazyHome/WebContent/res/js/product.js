 /* 상품상세페이지 버튼클릭시 수량 증가 */
<!--
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	
	amount = document.form.amount.value;
	amount2 = document.form.amount2.value;
	
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	hm2 = document.form.amount2;
	sum = document.form.sum;
	hm.value ++ ;
	hm2.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	hm2 = document.form.amount2;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
		if (hm2.value > 1) {
			hm2.value -- ;
		}
}

function change () {
	hm = document.form.amount;
	hm2 = document.form.amount2;
	
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
		if (hm2.value < 0) {
			hm2.value = 0;
		}
		
	sum.value = parseInt(hm.value) * sell_price;
}  
//-->

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
} 

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function inputOnlyNumberFormat(obj) {
    obj.value = onlynumber(uncomma(obj.value));
}

function onlynumber(str) {
    str = String(str);
}