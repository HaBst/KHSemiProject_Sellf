$(document).ready(function() {
	$("#allCheckBox").click(function() {
		if ($("#allCheckBox").prop("checked")) {
			$("input[name=chk]").prop("checked", true);
		} else {
			$("input[name=chk]").prop("checked", false);
		}
	});
});
var num = 1;
$(document).ready(function() {
	btnInit();

});

function btnInit()
{
	$("#quantityUp").hide();
	$("#quantityDown").hide();
	$("#changeBtn").click(function() {
		$("#changeBtn").hide('fast');
		$("#quantityUp").show();
		$("#quantityDown").show();
	});

	$("#quantityUp").click(function() {
		if (num < 10) {	
			num++;
		}
		$("#orderQuantity").text(num);
	});
	
	$("#quantityDown").click(function() {
		if (num > 1) {
			num--;
		}
		$("#orderQuantity").text(num);

	});
}

var flag = true;
function selectAllChk() {

	if (flag) {
		$("input[name=chk]").prop("checked", true);
		flag = false;
	} else {
		$("input[name=chk]").prop("checked", false);
		flag = true;
	}

}

function deleteOneBtn() {
	if ($("input[name=chk]").prop("checked")) {
		$("#cartlistTr[]").remove();
		console.log($('tbody>tr').length);
	}
	if ($('tbody>tr').length <= 0) {
		$('#dontHaveGoodsList').text("장바구니에 담긴 상품이 없습니다.");
	}
}

function totalPrice() {
	var totalPrice = 0;
	var goodsPrice = $("#goodsPrice").HTML();
	if ($("input[name=chk]").prop("checked")) {
		totalPrice += goodsPrice;
		$("#totalPrice").text(totalPrice);
	}

}



