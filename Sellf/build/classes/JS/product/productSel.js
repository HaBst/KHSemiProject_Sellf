
var tapBefore;
var infoTabArr =[];
window.onload = function()
{
	tapBefore = document.getElementById("firstLi");
	infoTabArr = document.getElementsByClassName("tabContents");
	
	hideAllTab();
	infoTabArr[0].style.display = "block";
}
function hideAllTab()
{
	for(var i = 0; i<infoTabArr.length;i++)
	{
		infoTabArr[i].style.display = "none";
	}
}
function changeTab(tabInfo, name)
{   
	 if(!tabInfo.classList.contains('active'))
	 {
	    tabInfo.classList.add('active');
	    tapBefore.classList.remove('active');
	    tapBefore = tabInfo;
	    hideAllTab();
//	    console.log(name);
	    name.style.display = "block";
//	    document.getElementById(name).style.display = "block";
	 }
}