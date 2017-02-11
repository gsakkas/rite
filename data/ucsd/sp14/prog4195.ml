
let foo l x = match l with | a::b::_ -> (List.map a [x]) @ (List.map b [x]);;

let f1::f2::[] = foo [(=); (<)] 2 f1 1;;
