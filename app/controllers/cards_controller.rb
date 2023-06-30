class CardsController < ApplicationController
    before_action :set_card, only: [:edit, :update, :destroy]
    before_action :set_cards, only: [:index, :create]

    def index 
    end

    def edit 
    end

    def create
        new_card = Card.new(card_permited_params)

        if new_card.save
            flash[:success] = "Card successfully created!" 
            redirect_to root_path
        else
            @error_messages = new_card.errors.full_messages
            render 'index'
        end
    end

    def update
        if @card.update(card_permited_params)
            flash[:success] = "Card successfully updated!" 
            redirect_to root_path
        else
            @error_messages = new_card.errors.full_messages
            render 'index'
        end
    end

    def destroy
        @card.destroy!
    rescue se
        flash[:danger] = se.message
    ensure
        redirect_to root_path
    end

    private 
    
    def card_permited_params
        params.require(:card).permit(:title, :description)
    end

    def set_card
        @card ||= Card.find(params[:id])
    end

    def set_cards 
        @cards ||= Card.by_recently_created
    end
end
