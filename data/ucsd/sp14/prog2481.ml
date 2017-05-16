
let rec digitsOfInt n = match n with | n::ns -> n :: ns;;

let _ = digitsOfInt 3124;;
