
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = f 0 [] in List.fold_left f base fs;;

let _ = pipe [(fun x  -> x + x); (fun x  -> x + 3)] 3;;
