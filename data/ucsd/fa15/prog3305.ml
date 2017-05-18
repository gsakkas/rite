
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let helper l = int_of_string (sepConcat "" (List.map string_of_int l));;

let helper x res n = if n > 0 then [helper x res (n - 1)] @ res else [];;
