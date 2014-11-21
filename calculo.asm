
extern x, y

global calculo

segment .data

segment .bss

segment .text

calculo:

	finit
	fld dword[1]
	fld dword[x]
	fabs
	fcomi st1
	jg Mayor

Menor:
	mov dword[y], 1

Mayor:
	fldl2e
	fmul st1, st0
	fsin
	fscale
	





