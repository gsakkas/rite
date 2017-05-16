
let rec digitsOfInt n = failwith "TBD:digitsOfInt";;

let digits n = digitsOfInt (abs n);;

let rec digitsOfInt n = if n < 0 then [] else (digits n) / 1;;
