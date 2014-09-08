require 'rails_helper'

RSpec.describe MeetingsController, :type => :controller do

  let(:valid_attributes) { { description: "A valid meeting description", location: "A valid meeting location" } }
  let(:invalid_attributes) { { description: "", location: "" } }

  context "with a signed in user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:meeting) { FactoryGirl.create(:meeting, user: user) }
    before { sign_in(user) }

    describe "GET index" do
      it "assigns all meetings as @meetings" do
        my_meeting = meeting
        get :index, {}
        expect(assigns(:meetings)).to eq([meeting])
      end
    end

    describe "GET show" do
      it "assigns the requested meeting as @meeting" do
        get :show, {:id => meeting.to_param}
        expect(assigns(:meeting)).to eq(meeting)
      end
    end

    describe "GET new" do
      it "assigns a new meeting as @meeting" do
        get :new, {}
        expect(assigns(:meeting)).to be_a_new(Meeting)
      end
    end

    describe "GET edit" do
      it "assigns the requested meeting as @meeting" do
        get :edit, {:id => meeting.to_param}
        expect(assigns(:meeting)).to eq(meeting)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Meeting" do
          expect {
            post :create, {:meeting => valid_attributes}
          }.to change(Meeting, :count).by(1)
        end

        it "assigns a newly created meeting as @meeting" do
          post :create, {:meeting => valid_attributes}
          expect(assigns(:meeting)).to be_a(Meeting)
          expect(assigns(:meeting)).to be_persisted
        end

        it "redirects to the created meeting" do
          post :create, {:meeting => valid_attributes}
          expect(response).to redirect_to(Meeting.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved meeting as @meeting" do
          post :create, {:meeting => invalid_attributes}
          expect(assigns(:meeting)).to be_a_new(Meeting)
        end

        it "re-renders the 'new' template" do
          post :create, {:meeting => invalid_attributes}
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        let(:new_attributes) { { description: "My Updated Description" } }

        it "updates the requested meeting" do
          put :update, {:id => meeting.to_param, :meeting => new_attributes}
          meeting.reload
          expect(meeting.description).to eq("My Updated Description")
        end

        it "assigns the requested meeting as @meeting" do
          put :update, {:id => meeting.to_param, :meeting => valid_attributes}
          expect(assigns(:meeting)).to eq(meeting)
        end

        it "redirects to the meeting" do
          put :update, {:id => meeting.to_param, :meeting => valid_attributes}
          expect(response).to redirect_to(meeting)
        end
      end

      describe "with invalid params" do
        it "assigns the meeting as @meeting" do
          put :update, {:id => meeting.to_param, :meeting => invalid_attributes}
          expect(assigns(:meeting)).to eq(meeting)
        end

        it "re-renders the 'edit' template" do
          put :update, {:id => meeting.to_param, :meeting => invalid_attributes}
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested meeting" do
        meeting # reference to create
        expect {
          delete :destroy, {:id => meeting.to_param}
        }.to change(Meeting, :count).by(-1)
      end

      it "redirects to the meetings list" do
        delete :destroy, {:id => meeting.to_param}
        expect(response).to redirect_to(meetings_url)
      end
    end

  end
end
