class SessionsController < ApplicationController
    def signup
        user = User.new(email: params[:email], password: params[:password])
        if user.save
            token = encode_user_data({ user_data: user.id })
            render json: { token: token , message: "Registration successful", data: user }
        else
            render json: { message: "Invalid Credentials" }
        end
    end

    def login
        user = User.find_by(email: params[:email])
        if user && user.password == params[:password]
            token = encode_user_data({ user_data: user.id })
            render json: { token: token , message: "Login successful", data: user}
        else
            render json: { message: "Invalid credentials" }
        end
    end
end
