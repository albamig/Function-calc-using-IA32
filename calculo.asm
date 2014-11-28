; Desarrollado por Sergio Delgado y Alberto Amigo
; 
; En este codigo hacemos un uso eficiente de la pila de FPU, habiendo conseguido eliminar
;	cargas y lecturas de memoria que, siendo evitables, solo harían tardar mas al programa

segment .bss
	control resw 1

segment .text

	extern x, y
	global calculo	

	calculo:
		finit
		fld1					; st0 = 1
		fld qword[x]
		fabs					; st0 = |x|, st1 = 1
		fcomi st1
		ja Mayor				; Si |x| > 1, entonces f(x) = (sen(x)*e^x)/(raiz2(x^2-1))
								; 	calculado en la etiqueta Mayor
	Menor:						; Sino f(x) = 1
		fld1					; 	calculado en la etiqueta Menor 
		fst qword[y]
		jmp Return

	Mayor:
		finit

		fstcw word[control]			; Fijamos los bits de la palabra de control de la FPU
		or word[control], 0x0C00	; 	para el redondeo
		fldcw word[control]

		fld1						; Será usado en (*) para almacenar al final de la pila un resultado y no perderlo

		fldl2e						; Aplicando logaritmos deducimos: e^x = 2^(x*log2(e))
		fld qword[x]
		fmulp					
		fld qword[x]
		fsin						; Como fscale redondea st1, trabajamos por separado
		fscale						; 	con parte entera y decimal
		fmulp st2, st0				; (*) sen(x)*2^redondeo(x*log2(e))
									; Estado de la pila: (st0)x*log2(e), (st1)sen(x)*2^redondeo(x*log2(e))
		fld1
		fmul st1					; Copia de x*log2(e) para no perder su valor al redondear
		frndint
		fsubp						; Conseguimos la parte decimal con x*log2(e) - redondeo(x*log2(e))
		f2xm1
		fld1						
		faddp						; 2^parteDecimal + 1 - 1 = 2^parteDecimal
		fmulp						; sen(x)*2^redondeo(x*log2(e))*2^parteDecimal(x*log2(e))
									; Estado de la pila: (st0)numerador
		fld qword[x]
		fld qword[x]
		fmulp
		fld1
		fsubp
		fsqrt						; raiz2(x^2-1)
		fdivp						; Estado de la pila: (st0)numerador/denominador
		fstp qword[y]
	Return:
		ret
