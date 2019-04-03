class Api::DecksController < ApplicationController
        before_action :set_deck, only: [:show, :edit, :update]
      
        def index
          @decks = current_user.decks
        end
      
        def show
        end
      
        def new
          @deck = current_user_decks.new
        end
      
        def create
          @deck = current_user.decks.new(deck_params)
          if @deck.save
            redirect_to decks_path
          else
            render :new
          end
        end
      
        def edit
        end
      
        def update
          if @deck.update(deck_params)
            redirect_to decks_path
          else
            render :edit
          end
        end
      
        def destroy
          @deck.destroy
          redirect_to deck_path
        end
      
        private
          def deck_params
            params.require(:deck).permit(:name)
          end
      
          def set_account
            @deck = current_user.decks.find(params[:id])
          end
      
      end