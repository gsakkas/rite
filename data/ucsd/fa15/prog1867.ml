
let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let digitSum = sumList digitList additivePersistence digitSum;;
