require "spec_helper"

describe UserMailer do
  let(:user) { FactoryGirl.create(:user) }

  describe "registration configuration email" do
    it "should render successfully" do
      expect do
        UserMailer.registration_confirmation(user)
      end.should_not raise_error
    end

    describe "successfully rendered" do
      let(:mailer) { UserMailer.registration_confirmation(user) }

      describe "body should contain" do
        subject { mailer.body }
        it { should have_content(user.name) }
        it { should have_content(edit_user_path(user)) }
      end

      it "should deliver successfully" do
        expect { mailer.deliver }.should_not raise_error
        expect { mailer.deliver }.should change(ActionMailer::Base.deliveries, :count).by(1)
      end

    end
  end
end
