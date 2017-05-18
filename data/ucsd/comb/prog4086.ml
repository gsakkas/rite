
let rec digitsOfInt n = match n with | 0 -> [] | n -> [digitsOfInt n];;
