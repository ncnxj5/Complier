.386
.model flat, stdcall

include e:\masm32\include\msvcrt.inc
includelib e:\masm32\lib\msvcrt.lib

.data
	numFmt db '%d',0
	chaFmt db '%c',0
	floFmt db '%f',0
	spaFmt db ' ',0
	entFmt db '---',0
	FLOAT_TEMP dd 0
	szFmt db '%d, ', 0
    _FLOAT2 REAL8 0.0
    array_0 DWORD 4,3,2,1,2,1,1,2,5,6
    _FLOAT1 REAL8 0.0
    _FLOAT0 REAL8 0.0
    _NUM2 DWORD 0
    _NUM1 DWORD 0
    _NUM0 DWORD 0
    len_0 DWORD 0
.code
print_space proc
	invoke crt_printf, addr spaFmt
	ret
print_space endp

print_num proc num
	invoke crt_printf, addr numFmt, num
	ret
print_num endp

print_cha proc char
	invoke crt_printf, addr chaFmt, char
	ret
print_cha endp

print_flo proc float:REAL8
	invoke crt_printf, addr floFmt, float
	ret
print_flo endp

print proc arr, len
	mov edi, arr								;把数组起始地址给一个寄存器
    mov ecx, len								;把数组元素数(将要反复的次数)给 ECX
    xor eax, eax
 Lp:
    mov  eax, [edi]								;edi 中的地址将不断变化, 通过 [edi] 获取元素值
	push ecx
	push edi
	invoke crt_printf, addr szFmt, eax
	pop edi
	pop ecx
    add  edi, type arr								;获取下一个元素的地址
    loop Lp
	;invoke crt_printf, addr entFmt
	ret
print endp
quicksort proc s,l,r
    LOCAL i_1:DWORD
    LOCAL x_1:DWORD
    LOCAL j_1:DWORD
    mov esi,l
    mov ebx,r
    push ecx
    push ebx
    push esi
    push ebx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    mov eax,esi
.IF eax>0
    mov ecx,l
    mov i_1,ecx
    mov edx,r
    mov j_1,edx
    mov edi,l
    mov esi,s
    mov edi,DWORD ptr[esi+edi*4]
    mov x_1,edi
    mov ebx,i_1
    mov ecx,j_1
    push ecx
    push ebx
    push ebx
    push ecx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ebx,eax
    mov eax,ebx
.WHILE eax>0
    mov edx,i_1
    mov edi,j_1
    push ecx
    push ebx
    push edx
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov edx,eax
    mov esi,j_1
    mov ebx,s
    mov esi,DWORD ptr[ebx+esi*4]
    mov ecx,x_1
    push ecx
    push ebx
    push ecx
    push esi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jl @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    and edx,esi
    mov eax,edx
.WHILE eax>0
    mov edx,j_1
    mov edi,1
    sub edx,edi
    mov j_1,edx
    mov esi,i_1
    mov ebx,j_1
    push ecx
    push ebx
    push esi
    push ebx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    mov ecx,j_1
    mov edx,s
    mov ecx,DWORD ptr[edx+ecx*4]
    mov edi,x_1
    push ecx
    push ebx
    push edi
    push ecx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jl @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ecx,eax
    and esi,ecx
    mov eax,esi
.ENDW
    mov esi,i_1
    mov ebx,j_1
    push ecx
    push ebx
    push esi
    push ebx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    mov eax,esi
.IF eax>0
    mov ecx,j_1
    mov edx,s
    mov ecx,DWORD ptr[edx+ecx*4]
    mov edi,i_1
    mov esi,s
    mov DWORD ptr[esi+edi*4],ecx
    mov ebx,i_1
    mov ecx,1
    add ebx,ecx
    mov i_1,ebx
.ENDIF
    mov edx,i_1
    mov edi,j_1
    push ecx
    push ebx
    push edx
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov edx,eax
    mov esi,i_1
    mov ebx,s
    mov esi,DWORD ptr[ebx+esi*4]
    mov ecx,x_1
    push ecx
    push ebx
    push esi
    push ecx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    and edx,esi
    mov eax,edx
.WHILE eax>0
    mov edx,i_1
    mov edi,1
    add edx,edi
    mov i_1,edx
    mov esi,i_1
    mov ebx,j_1
    push ecx
    push ebx
    push esi
    push ebx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    mov ecx,i_1
    mov edx,s
    mov ecx,DWORD ptr[edx+ecx*4]
    mov edi,x_1
    push ecx
    push ebx
    push ecx
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov ecx,eax
    and esi,ecx
    mov eax,esi
.ENDW
    mov esi,i_1
    mov ebx,j_1
    push ecx
    push ebx
    push esi
    push ebx
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov esi,eax
    mov eax,esi
.IF eax>0
    mov ecx,i_1
    mov edx,s
    mov ecx,DWORD ptr[edx+ecx*4]
    mov edi,j_1
    mov esi,s
    mov DWORD ptr[esi+edi*4],ecx
    mov ebx,j_1
    mov ecx,1
    sub ebx,ecx
    mov j_1,ebx
.ENDIF
    mov edx,i_1
    mov edi,j_1
    push ecx
    push ebx
    push edx
    push edi
    pop ebx
    pop ecx
    cmp ebx,ecx
    mov eax,0
    jle @F
    mov eax,1
    @@:
    pop ebx
    pop ecx
    mov edx,eax
    mov eax,edx
.ENDW
    mov esi,x_1
    mov ebx,i_1
    mov ecx,s
    mov DWORD ptr[ecx+ebx*4],esi
    mov edx,l
    mov _NUM1,edx
    mov edi,i_1
    mov esi,1
    sub edi,esi
    mov _NUM2,edi
    invoke quicksort,s,_NUM1,_NUM2
    mov ebx,i_1
    mov ecx,1
    add ebx,ecx
    mov _NUM1,ebx
    mov edx,r
    mov _NUM2,edx
    invoke quicksort,s,_NUM1,_NUM2
.ENDIF
    mov edi,0
    mov eax,edi
    ret
    quicksort endp
fuse proc 
    mov esi,10
    mov len_0,esi
    mov ebx,0
    mov _NUM1,ebx
    mov ecx,len_0
    mov edx,1
    sub ecx,edx
    mov _NUM2,ecx
    invoke quicksort,addr array_0,_NUM1,_NUM2
    mov edi,0
    mov eax,edi
    invoke print,addr array_0,10
    ret
fuse endp
main proc
	invoke fuse
	;invoke print_num,eax
	invoke crt_scanf
main endp

end main
