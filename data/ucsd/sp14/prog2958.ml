
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = if (List.length sl) > 1 then a ^ (sep ^ x) else a ^ x in
      let base = if (List.length sl) > 1 then h else h in
      let l = t in List.fold_left f base l;;

let stringOfList f l = List.map (sepConcat l);;

let _ =
  stringOfList (stringOfList string_of_int) [[1; 2; 3]; [4; 5]; [6]; []];;
