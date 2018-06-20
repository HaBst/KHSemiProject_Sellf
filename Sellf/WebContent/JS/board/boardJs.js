/**
 * 
 */

var btnArr = [];
var tabArr = [];
var selectStyle = "background-color:gray; color:white; border:1px solid lightgray;";
var nonSelectStyle = "background-color:white; color:black; border:1px solid lightgray;";
window.onload = function()
{
	btnArr = document.getElementsByClassName("menuBtn");
	btnArr[0].style = selectStyle;
	
	tabArr = document.getElementsByClassName("noticeTab");
	tabArr[0].style.display = "block";

}
function clearAll()
{
	for(var i = 0; i<btnArr.length;i++)
	{
		btnArr[i].style=nonSelectStyle;
	}
	for(var i = 0; i<tabArr.length;i++)
	{
		tabArr[i].style.display ="none";
	}
}
function boardTapChange(btn, boardName)
{
	console.log(boardName.id);
	if(boardName.id=="boardListArea") location.href="/notice";
	if(boardName.id=="answerListArea") location.href="/faq";
	clearAll();
	btn.style = selectStyle;
	boardName.style.display = "block";

}