
let rec digitsOfInt n = match n with | _ -> (n mod (10 digitsOfInt n)) / 10;;
