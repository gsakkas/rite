
let stringOfList f l = let g x = (f x) ^ "; " in "[" ^ ((List.map g l) "]");;
