
let stringOfList f l =
  let g a x = a ^ ("; " ^ (f x)) in "[" ^ ((List.map g l) "]");;
