require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe BillsController do

  # This should return the minimal set of attributes required to create a valid
  # Bill. As you add validations to Bill, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BillsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    xit "assigns all bills as @bills" do
      bill = Bill.create! valid_attributes
      get :index, {}, valid_session
      assigns(:bills).should eq([bill])
    end
  end

  describe "GET show" do
    it "assigns the requested bill as @bill" do
      bill = Bill.get("http://billit.ciudadanointeligente.org/bills/1-07", 'application/json')
      # bill = Bill.create! valid_attributes
      get :show, {:id => bill.uid}, valid_session
      assigns(:bill).uid.should eq(bill.uid)
      assigns(:bill).title.should eq(bill.title)
      assigns(:bill).creation_date.should eq(bill.creation_date)
      assigns(:bill).initiative.should eq(bill.initiative)
      assigns(:bill).origin_chamber.should eq(bill.origin_chamber)
      assigns(:bill).current_urgency.should eq(bill.current_urgency)
      assigns(:bill).stage.should eq(bill.stage)
      assigns(:bill).sub_stage.should eq(bill.sub_stage)
      assigns(:bill).state.should eq(bill.state)
      assigns(:bill).law.should eq(bill.law)
      assigns(:bill).link_law.should eq(bill.link_law)
      assigns(:bill).merged.should eq(bill.merged)
      assigns(:bill).matters.should eq(bill.matters)
      assigns(:bill).authors.should eq(bill.authors)
      assigns(:bill).events.should eq(bill.events)
      assigns(:bill).urgencies.should eq(bill.urgencies)
      assigns(:bill).reports.should eq(bill.reports)
      assigns(:bill).modifications.should eq(bill.modifications)
      assigns(:bill).documents.should eq(bill.documents)
      assigns(:bill).instructions.should eq(bill.instructions)
      assigns(:bill).observations.should eq(bill.observations)
      assigns(:bill).links.should eq(bill.links)
    end
  end

  describe "GET new" do
    xit "assigns a new bill as @bill" do
      get :new, {}, valid_session
      assigns(:bill).should be_a_new(Bill)
    end
  end

  describe "GET edit" do
    xit "assigns the requested bill as @bill" do
      bill = Bill.create! valid_attributes
      get :edit, {:id => bill.to_param}, valid_session
      assigns(:bill).should eq(bill)
    end
  end

  describe "GET search" do
    it "returns an array" do
      get :search, q: "salud"
      assigns(:query).bills.should be_an Array
    end

    it "has a self reference" do
      get :search, q: "salud"
      assigns(:query).self.should eq("http://billit.ciudadanointeligente.org/bills/search?&page=1&q=salud")
    end

    it "has a next page" do
      get :search, q: "salud"
      assigns(:query).next.should eq("http://billit.ciudadanointeligente.org/bills/search?&page=2&q=salud")
    end

    it "has a previous page" do
      get :search, q: "salud", page: 2
      assigns(:query).previous.should eq("http://billit.ciudadanointeligente.org/bills/search?&page=1&q=salud")
    end

    it "has all matadata" do
      get :search, q: "salud"
      assigns(:query).total_entries.should_not be_nil
      assigns(:query).current_page.should_not be_nil
      assigns(:query).total_pages.should_not be_nil
    end
  end

  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Bill" do
        expect {
          post :create, {:bill => valid_attributes}, valid_session
        }.to change(Bill, :count).by(1)
      end

      xit "assigns a newly created bill as @bill" do
        post :create, {:bill => valid_attributes}, valid_session
        assigns(:bill).should be_a(Bill)
        assigns(:bill).should be_persisted
      end

      xit "redirects to the created bill" do
        post :create, {:bill => valid_attributes}, valid_session
        response.should redirect_to(Bill.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved bill as @bill" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => {  }}, valid_session
        assigns(:bill).should be_a_new(Bill)
      end

      xit "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        post :create, {:bill => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested bill" do
        #bill = Bill.create! valid_attributes
        bill = Bill.get("http://billit.ciudadanointeligente.org/bills/6967-06", 'application/json')
        #Bill.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {id: bill.uid, tags: bill.tags}, valid_session
        assigns(:bill).tags.should eq(bill.tags)
      end

      xit "assigns the requested bill as @bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        assigns(:bill).should eq(bill)
      end

      xit "redirects to the bill" do
        bill = Bill.create! valid_attributes
        put :update, {:id => bill.to_param, :bill => valid_attributes}, valid_session
        response.should redirect_to(bill)
      end
    end

    describe "with invalid params" do
      xit "assigns the bill as @bill" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => {  }}, valid_session
        assigns(:bill).should eq(bill)
      end

      xit "re-renders the 'edit' template" do
        bill = Bill.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Bill.any_instance.stub(:save).and_return(false)
        put :update, {:id => bill.to_param, :bill => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested bill" do
      bill = Bill.create! valid_attributes
      expect {
        delete :destroy, {:id => bill.to_param}, valid_session
      }.to change(Bill, :count).by(-1)
    end

    xit "redirects to the bills list" do
      bill = Bill.create! valid_attributes
      delete :destroy, {:id => bill.to_param}, valid_session
      response.should redirect_to(bills_url)
    end
  end

end