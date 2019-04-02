class Api::DecksController < ApplicationController
    def index
        render json: Deck.all
      end
    
      def create
        deck = Deck.new(deck_params)
        if deck.save
          render json: deck
        else
          render json: { errors: deck.errors }, status: :unprocessable_entity 
        end
      end
    
      def update
        deck = Deck.find(params[:id])
        deck.update(complete: !deck.complete)
        render json: deck
      end
    
      def destroy
        Deck.find(params[:id]).destroy
        render json: { message: 'Deck deleted' }
      end
    
      private
    
      def deck_params
        params.require(:deck).permit(:name, :complete)
      end
    
end
