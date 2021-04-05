 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/trackings", type: :request do
  # Tracking. As you add validations to Tracking, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tracking.create! valid_attributes
      get trackings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tracking = Tracking.create! valid_attributes
      get tracking_url(tracking)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tracking_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      tracking = Tracking.create! valid_attributes
      get edit_tracking_url(tracking)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tracking" do
        expect {
          post trackings_url, params: { tracking: valid_attributes }
        }.to change(Tracking, :count).by(1)
      end

      it "redirects to the created tracking" do
        post trackings_url, params: { tracking: valid_attributes }
        expect(response).to redirect_to(tracking_url(Tracking.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tracking" do
        expect {
          post trackings_url, params: { tracking: invalid_attributes }
        }.to change(Tracking, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post trackings_url, params: { tracking: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tracking" do
        tracking = Tracking.create! valid_attributes
        patch tracking_url(tracking), params: { tracking: new_attributes }
        tracking.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tracking" do
        tracking = Tracking.create! valid_attributes
        patch tracking_url(tracking), params: { tracking: new_attributes }
        tracking.reload
        expect(response).to redirect_to(tracking_url(tracking))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tracking = Tracking.create! valid_attributes
        patch tracking_url(tracking), params: { tracking: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tracking" do
      tracking = Tracking.create! valid_attributes
      expect {
        delete tracking_url(tracking)
      }.to change(Tracking, :count).by(-1)
    end

    it "redirects to the trackings list" do
      tracking = Tracking.create! valid_attributes
      delete tracking_url(tracking)
      expect(response).to redirect_to(trackings_url)
    end
  end
end
