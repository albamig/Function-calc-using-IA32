
extern x, y, a1, a2, a3, a4, a5, a6

global calculo

segment .data
segment .bss
	numerador resq 1
segment .text
calculo:
	finit
L1:
	fld1
	fld qword[x]
L2:
	fabs
	fcomi st1
	ja Mayor

Menor:
L3:
	fld1
	fst qword[y]
	ret

Mayor:
	finit
	fldl2e
	fld qword[x]
	fmul st1, st0

	fst qword[a1]

	fsin

	fst qword[a2]
	
	fscale

	fst qword[a3]

	fst qword[numerador]
	
	finit
	fld1
	fld qword[x]
	fld qword[x]
	fmulp st1
	fsub st1
	fsqrt
	fld qword[numerador]
	fdiv st1

	fst qword[y]
	ret