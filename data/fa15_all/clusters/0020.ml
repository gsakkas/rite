AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])
digitsOfInt (n / 10) @ [n mod 10]
listReverse tl @ [h]
mulByDigit i tl @ [hd * i]
[cout (hd , i)] @ mulByDigit i
                             tl
append (digitsOfInt n2) [n2]
[((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t)
clone x (n - 1) @ [x]
[x] @ clone x (n - 1)
append (digitsOfInt (n / 10))
       [n mod 10]
listReverse t @ [h]
digitsOfInt (n / 10) @ [modulus n']
List.rev (List.combine l1
                       l2) @ [(0 , 0)]
listReverse tail @ [head]
[n mod 10] @ digitsOfInt (n / 10)
listReverse tail @ [hd]
listReverse l @ [h]
digitsOfInt n @ [x]
listReverse y @ [x]
digitsOfInt r @ [digit]
digitsOfInt (n / 10) @ [x]
[((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t)
[h * i] @ mulByDigit i t
digitsOfInt ((n - (n mod 10)) / 10) @ [n mod 10]
[s + c] @ (s' @ [((x1 + x2) + c) mod 10])
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
[((x * i) mod 10) + x'] @ (mulByDigit i
                                      [x'] @ x'')
