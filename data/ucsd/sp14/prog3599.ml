
let pipe fs =
  let f a x b = x (a b) in let base x = x in List.fold_left f base fs;;

let stringOfList f l = f (pipe List.map l);;
