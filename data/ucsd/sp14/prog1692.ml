
let stringOfList f l =
  "[" ^
    ((List.fold_right (fun x  -> fun acc  -> x ^ ("; " ^ acc)) ""
        (List.map f l))
       ^ "]");;
