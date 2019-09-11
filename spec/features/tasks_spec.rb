require 'rails_helper'

feature "tasks/index" do
  scenario "renders a list of tasks" do
    create(:homework)
    create(:email)

    visit tasks_path

    expect(page).to have_content('complete homework')
    expect(page).to have_content("reply to Zack's email")
  end
end

  feature 'New Task' do
    scenario 'user adds a new task' do

      visit tasks_path

      expect{
        click_link 'New Task'
        fill_in 'Name', with: 'Learn Rspec'
        fill_in 'Priority', with: 1
        click_button('Create Task')
      }.to change(Task, :count).by(1)

      expect(current_path).to eq(task_path(Task.last.id))
      expect(page).to have_content('Learn Rspec')

    end
  end

  feature 'Edit Task' do
     before :each do
       @task = create(:task)
     end

    scenario 'User edits task' do
      visit task_path(@task)
      expect(page).to have_content('buy beer')

      click_link("Edit")

      fill_in 'Name', with: 'Learn Rspec'
      fill_in "Priority", with: 1
      click_button('Update Task')

      expect(current_path).to eq(task_path(@task.id))

      expect(page).to have_content('Learn Rspec')
    end

  end
