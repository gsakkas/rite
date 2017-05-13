
let pipe2 fs =
  function
  | n ->
      let rec helper res =
        function | [] -> res | x::xs' -> helper (x res) xs' in
      helper n fs;;

let _ = pipe2 [(fun x  -> x + 3); (fun x  -> x + x)] 3 asdf;;
