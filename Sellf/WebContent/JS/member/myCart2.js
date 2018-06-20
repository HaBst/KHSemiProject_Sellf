$(document).ready(
		function() {

			$("#orderBtn").click(
					function() {
						var memberName = $("#memberName").val();
						var email = $("#email").val();
						var phone = $("#phone").val();
						var detailAddress = $("#detailAddress").val();
						var address = $("#address").val();

						if (memberName == "" || email == "" || phone == ""
								|| detailAddress == "" || address == "") {

							alert("값을 다 입력해줘!");
							$("#orderResult").text(
									"빈칸 없이 입력해주세요 (2초 후 페이지 새로고침)");
							setInterval(function() {
								location.reload();
							}, 2000);

						} else {

							alert("잘했어");
							location.href = "../../views/member/myCart3.jsp";
						}
					});
		});

function availableCouponsBtn() {
	window
			.open(
					"/views/member/availableCoupons.jsp",
					"pop",
					"toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,width=400px,height=500px");
}