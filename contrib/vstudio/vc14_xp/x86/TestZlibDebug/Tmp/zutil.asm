; Listing generated by Microsoft (R) Optimizing Compiler Version 19.00.24215.1 

	TITLE	C:\Users\Sam\Repos\zlib-1.2.8\zutil.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

PUBLIC	_z_errmsg
_BSS	SEGMENT
$SG84564 DB	01H DUP (?)
$SG84571 DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
$SG84562 DB	'need dictionary', 00H
$SG84563 DB	'stream end', 00H
	ORG $+1
$SG84565 DB	'file error', 00H
	ORG $+1
$SG84566 DB	'stream error', 00H
	ORG $+3
$SG84567 DB	'data error', 00H
	ORG $+1
$SG84568 DB	'insufficient memory', 00H
$SG84569 DB	'buffer error', 00H
	ORG $+3
$SG84570 DB	'incompatible version', 00H
	ORG $+3
$SG84573 DB	'1.2.8', 00H
_DATA	ENDS
CONST	SEGMENT
_z_errmsg DD	FLAT:$SG84562
	DD	FLAT:$SG84563
	DD	FLAT:$SG84564
	DD	FLAT:$SG84565
	DD	FLAT:$SG84566
	DD	FLAT:$SG84567
	DD	FLAT:$SG84568
	DD	FLAT:$SG84569
	DD	FLAT:$SG84570
	DD	FLAT:$SG84571
CONST	ENDS
PUBLIC	_zlibVersion@0
PUBLIC	_zlibCompileFlags@0
PUBLIC	_zError@4
PUBLIC	_zcalloc
PUBLIC	_zcfree
EXTRN	__imp__free:PROC
EXTRN	__imp__malloc:PROC
; Function compile flags: /Odtp
; File c:\users\sam\repos\zlib-1.2.8\zutil.c
_TEXT	SEGMENT
_opaque$ = 8						; size = 4
_ptr$ = 12						; size = 4
_zcfree	PROC

; 317  : {

	push	ebp
	mov	ebp, esp

; 318  :     free(ptr);

	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	DWORD PTR __imp__free
	add	esp, 4

; 319  :     if (opaque) return; /* make compiler happy */
; 320  : }

	pop	ebp
	ret	0
_zcfree	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\sam\repos\zlib-1.2.8\zutil.c
_TEXT	SEGMENT
_opaque$ = 8						; size = 4
_items$ = 12						; size = 4
_size$ = 16						; size = 4
_zcalloc PROC

; 308  : {

	push	ebp
	mov	ebp, esp

; 309  :     if (opaque) items += size - size; /* make compiler happy */

	cmp	DWORD PTR _opaque$[ebp], 0
	je	SHORT $LN2@zcalloc
	mov	eax, DWORD PTR _size$[ebp]
	sub	eax, DWORD PTR _size$[ebp]
	add	eax, DWORD PTR _items$[ebp]
	mov	DWORD PTR _items$[ebp], eax
$LN2@zcalloc:

; 310  :     return sizeof(uInt) > 2 ? (voidpf)malloc(items * size) :

	mov	ecx, DWORD PTR _items$[ebp]
	imul	ecx, DWORD PTR _size$[ebp]
	push	ecx
	call	DWORD PTR __imp__malloc
	add	esp, 4

; 311  :                               (voidpf)calloc(items, size);
; 312  : }

	pop	ebp
	ret	0
_zcalloc ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\sam\repos\zlib-1.2.8\zutil.c
_TEXT	SEGMENT
_err$ = 8						; size = 4
_zError@4 PROC

; 138  : {

	push	ebp
	mov	ebp, esp

; 139  :     return ERR_MSG(err);

	mov	eax, 2
	sub	eax, DWORD PTR _err$[ebp]
	mov	eax, DWORD PTR _z_errmsg[eax*4]

; 140  : }

	pop	ebp
	ret	4
_zError@4 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\sam\repos\zlib-1.2.8\zutil.c
_TEXT	SEGMENT
tv85 = -20						; size = 4
tv78 = -16						; size = 4
tv71 = -12						; size = 4
tv64 = -8						; size = 4
_flags$ = -4						; size = 4
_zlibCompileFlags@0 PROC

; 36   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H

; 37   :     uLong flags;
; 38   : 
; 39   :     flags = 0;

	mov	DWORD PTR _flags$[ebp], 0

; 40   :     switch ((int)(sizeof(uInt))) {

	mov	DWORD PTR tv64[ebp], 4
	cmp	DWORD PTR tv64[ebp], 2
	je	SHORT $LN10@zlibCompil
	cmp	DWORD PTR tv64[ebp], 4
	je	SHORT $LN11@zlibCompil
	cmp	DWORD PTR tv64[ebp], 8
	je	SHORT $LN12@zlibCompil
	jmp	SHORT $LN13@zlibCompil
$LN10@zlibCompil:

; 41   :     case 2:     break;

	jmp	SHORT $LN2@zlibCompil
$LN11@zlibCompil:

; 42   :     case 4:     flags += 1;     break;

	mov	eax, DWORD PTR _flags$[ebp]
	add	eax, 1
	mov	DWORD PTR _flags$[ebp], eax
	jmp	SHORT $LN2@zlibCompil
$LN12@zlibCompil:

; 43   :     case 8:     flags += 2;     break;

	mov	ecx, DWORD PTR _flags$[ebp]
	add	ecx, 2
	mov	DWORD PTR _flags$[ebp], ecx
	jmp	SHORT $LN2@zlibCompil
$LN13@zlibCompil:

; 44   :     default:    flags += 3;

	mov	edx, DWORD PTR _flags$[ebp]
	add	edx, 3
	mov	DWORD PTR _flags$[ebp], edx
$LN2@zlibCompil:

; 45   :     }
; 46   :     switch ((int)(sizeof(uLong))) {

	mov	DWORD PTR tv71[ebp], 4
	cmp	DWORD PTR tv71[ebp], 2
	je	SHORT $LN14@zlibCompil
	cmp	DWORD PTR tv71[ebp], 4
	je	SHORT $LN15@zlibCompil
	cmp	DWORD PTR tv71[ebp], 8
	je	SHORT $LN16@zlibCompil
	jmp	SHORT $LN17@zlibCompil
$LN14@zlibCompil:

; 47   :     case 2:     break;

	jmp	SHORT $LN4@zlibCompil
$LN15@zlibCompil:

; 48   :     case 4:     flags += 1 << 2;        break;

	mov	eax, DWORD PTR _flags$[ebp]
	add	eax, 4
	mov	DWORD PTR _flags$[ebp], eax
	jmp	SHORT $LN4@zlibCompil
$LN16@zlibCompil:

; 49   :     case 8:     flags += 2 << 2;        break;

	mov	ecx, DWORD PTR _flags$[ebp]
	add	ecx, 8
	mov	DWORD PTR _flags$[ebp], ecx
	jmp	SHORT $LN4@zlibCompil
$LN17@zlibCompil:

; 50   :     default:    flags += 3 << 2;

	mov	edx, DWORD PTR _flags$[ebp]
	add	edx, 12					; 0000000cH
	mov	DWORD PTR _flags$[ebp], edx
$LN4@zlibCompil:

; 51   :     }
; 52   :     switch ((int)(sizeof(voidpf))) {

	mov	DWORD PTR tv78[ebp], 4
	cmp	DWORD PTR tv78[ebp], 2
	je	SHORT $LN18@zlibCompil
	cmp	DWORD PTR tv78[ebp], 4
	je	SHORT $LN19@zlibCompil
	cmp	DWORD PTR tv78[ebp], 8
	je	SHORT $LN20@zlibCompil
	jmp	SHORT $LN21@zlibCompil
$LN18@zlibCompil:

; 53   :     case 2:     break;

	jmp	SHORT $LN6@zlibCompil
$LN19@zlibCompil:

; 54   :     case 4:     flags += 1 << 4;        break;

	mov	eax, DWORD PTR _flags$[ebp]
	add	eax, 16					; 00000010H
	mov	DWORD PTR _flags$[ebp], eax
	jmp	SHORT $LN6@zlibCompil
$LN20@zlibCompil:

; 55   :     case 8:     flags += 2 << 4;        break;

	mov	ecx, DWORD PTR _flags$[ebp]
	add	ecx, 32					; 00000020H
	mov	DWORD PTR _flags$[ebp], ecx
	jmp	SHORT $LN6@zlibCompil
$LN21@zlibCompil:

; 56   :     default:    flags += 3 << 4;

	mov	edx, DWORD PTR _flags$[ebp]
	add	edx, 48					; 00000030H
	mov	DWORD PTR _flags$[ebp], edx
$LN6@zlibCompil:

; 57   :     }
; 58   :     switch ((int)(sizeof(z_off_t))) {

	mov	DWORD PTR tv85[ebp], 4
	cmp	DWORD PTR tv85[ebp], 2
	je	SHORT $LN22@zlibCompil
	cmp	DWORD PTR tv85[ebp], 4
	je	SHORT $LN23@zlibCompil
	cmp	DWORD PTR tv85[ebp], 8
	je	SHORT $LN24@zlibCompil
	jmp	SHORT $LN25@zlibCompil
$LN22@zlibCompil:

; 59   :     case 2:     break;

	jmp	SHORT $LN8@zlibCompil
$LN23@zlibCompil:

; 60   :     case 4:     flags += 1 << 6;        break;

	mov	eax, DWORD PTR _flags$[ebp]
	add	eax, 64					; 00000040H
	mov	DWORD PTR _flags$[ebp], eax
	jmp	SHORT $LN8@zlibCompil
$LN24@zlibCompil:

; 61   :     case 8:     flags += 2 << 6;        break;

	mov	ecx, DWORD PTR _flags$[ebp]
	add	ecx, 128				; 00000080H
	mov	DWORD PTR _flags$[ebp], ecx
	jmp	SHORT $LN8@zlibCompil
$LN25@zlibCompil:

; 62   :     default:    flags += 3 << 6;

	mov	edx, DWORD PTR _flags$[ebp]
	add	edx, 192				; 000000c0H
	mov	DWORD PTR _flags$[ebp], edx
$LN8@zlibCompil:

; 63   :     }
; 64   : #ifdef DEBUG
; 65   :     flags += 1 << 8;
; 66   : #endif
; 67   : #if defined(ASMV) || defined(ASMINF)
; 68   :     flags += 1 << 9;

	mov	eax, DWORD PTR _flags$[ebp]
	add	eax, 512				; 00000200H
	mov	DWORD PTR _flags$[ebp], eax

; 69   : #endif
; 70   : #ifdef ZLIB_WINAPI
; 71   :     flags += 1 << 10;

	mov	ecx, DWORD PTR _flags$[ebp]
	add	ecx, 1024				; 00000400H
	mov	DWORD PTR _flags$[ebp], ecx

; 72   : #endif
; 73   : #ifdef BUILDFIXED
; 74   :     flags += 1 << 12;
; 75   : #endif
; 76   : #ifdef DYNAMIC_CRC_TABLE
; 77   :     flags += 1 << 13;
; 78   : #endif
; 79   : #ifdef NO_GZCOMPRESS
; 80   :     flags += 1L << 16;
; 81   : #endif
; 82   : #ifdef NO_GZIP
; 83   :     flags += 1L << 17;
; 84   : #endif
; 85   : #ifdef PKZIP_BUG_WORKAROUND
; 86   :     flags += 1L << 20;
; 87   : #endif
; 88   : #ifdef FASTEST
; 89   :     flags += 1L << 21;
; 90   : #endif
; 91   : #if defined(STDC) || defined(Z_HAVE_STDARG_H)
; 92   : #  ifdef NO_vsnprintf
; 93   :     flags += 1L << 25;
; 94   : #    ifdef HAS_vsprintf_void
; 95   :     flags += 1L << 26;
; 96   : #    endif
; 97   : #  else
; 98   : #    ifdef HAS_vsnprintf_void
; 99   :     flags += 1L << 26;
; 100  : #    endif
; 101  : #  endif
; 102  : #else
; 103  :     flags += 1L << 24;
; 104  : #  ifdef NO_snprintf
; 105  :     flags += 1L << 25;
; 106  : #    ifdef HAS_sprintf_void
; 107  :     flags += 1L << 26;
; 108  : #    endif
; 109  : #  else
; 110  : #    ifdef HAS_snprintf_void
; 111  :     flags += 1L << 26;
; 112  : #    endif
; 113  : #  endif
; 114  : #endif
; 115  :     return flags;

	mov	eax, DWORD PTR _flags$[ebp]

; 116  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_zlibCompileFlags@0 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File c:\users\sam\repos\zlib-1.2.8\zutil.c
_TEXT	SEGMENT
_zlibVersion@0 PROC

; 31   : {

	push	ebp
	mov	ebp, esp

; 32   :     return ZLIB_VERSION;

	mov	eax, OFFSET $SG84573

; 33   : }

	pop	ebp
	ret	0
_zlibVersion@0 ENDP
_TEXT	ENDS
END
