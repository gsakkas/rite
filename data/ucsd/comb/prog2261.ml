
let rec addPHelper (num,sum,count) =
  if (num < 10) && (sum < 10)
  then count
  else
    if num = 0
    then
      (addPHelper (sum, 0, (count + 1));
       Printf.printf "num is %d and sum is %d and count is %d\n" num sum
         count)
    else addPHelper ((num / 10), ((num mod 10) + sum), count);;
