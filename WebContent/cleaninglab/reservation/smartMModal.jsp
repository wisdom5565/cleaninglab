<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="returnImg()"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body" id="modal-body" >
<input type="image" class="imgChB" id="imgChBL" src='/cleaninglab/images/releft.png' onclick="reImgCh('l')">
<input type="image" class="imgChB" id="imgChBR" src='/cleaninglab/images/reright.png' onclick="reImgCh('r')">
</div>
<div class="modal-footer">
<button type="button" class="close" id="close" data-dismiss="modal" onclick="returnImg()">닫기</button>
</div>
