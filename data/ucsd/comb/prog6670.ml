
let stringOfList f l = "[" ^ ((List.fold_left f "" l) ^ "]");;

let _ = stringOfList (fun x  -> x) ["foo"];;
