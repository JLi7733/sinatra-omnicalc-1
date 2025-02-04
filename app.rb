require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
  @num = params["number"].to_f

  @square = @num**2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:sqrt)
end

get("/square_root/results") do
  @user_num = params["user_number"].to_f

  @sqrt = Math.sqrt(@user_num)

  erb(:sqrt_results)
end

get("/random/new") do
  erb(:random)
end

get("/random/results") do
  @min = params["user_min"].to_f

  @max = params["user_max"].to_f

  @rand = rand(@min..@max)

  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @APR = params["user_apr"].to_f
  r = @APR/1200

  @years = params["user_years"].to_i
  n = @years*12

  @principal = params["user_pv"].to_f

  numer = r*@principal

  denom = 1-((1+r) ** -n)

  @payment = numer/denom

  @payment = @payment.to_fs(:currency)
  @APR = @APR.to_fs(:percentage, {:precision => 4})

  erb(:payment_results)
end
