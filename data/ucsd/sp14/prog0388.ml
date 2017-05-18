
let foldl f b xs =
  let rec helper res = function | [] -> res | h::t -> helper (f res h) t in
  helper b xs;;

let rec map f xs = match xs with | [] -> [] | h::t -> (f h) :: (map f t);;

let (|>) x f = f x;;

let sumofsquares xs = (xs |> (map (fun x  -> x * x))) |> (foldl (+) 0);;

let _ = sumofsquares 5;;
