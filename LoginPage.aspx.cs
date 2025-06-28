using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace ProjectSixthSemester
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                // Read the value of the hidden field to determine which panel was last active
                string panelState = hdnPanelState.Value;

                if (panelState == "register")
                {
                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "ToggleToRegister",
                        "document.querySelector('.container').classList.add('active');",
                        true
                    );
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Value.Trim();
            string password = txtPassword.Value.Trim();

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "Username and Password cannot be empty.";
                return;
            }

            if (!IsValidEmail(username))
            {
                lblMessage.Text = "Please enter a valid email address.";
                return;
            }

            if (password.Length < 6)
            {
                lblMessage.Text = "Password must be at least 6 characters long.";
                return;
            }

            // TODO: Add database check here for valid credentials
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Validation passed. Ready to login.";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtRegUsername.Value.Trim();
            string email = txtRegEmail.Value.Trim();
            string password = txtRegPassword.Value.Trim();

            // Check for empty fields
            if (string.IsNullOrWhiteSpace(username) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password))
            {
                lblRegisterMessage.Text = "All fields are required.";
                return;
            }

            // Email format check
            if (!IsValidEmail(email))
            {
                lblRegisterMessage.Text = "Please enter a valid email.";
                return;
            }

            // Password strength check
            if (password.Length < 6)
            {
                lblRegisterMessage.Text = "Password must be at least 6 characters.";
                return;
            }

            // TODO: Save user to database here
            lblRegisterMessage.ForeColor = System.Drawing.Color.Green;
            lblRegisterMessage.Text = "Registration successful!";

            // Clear fields after successful registration
            txtRegUsername.Value = "";
            txtRegEmail.Value = "";
            txtRegPassword.Value = "";
        }

        private bool IsValidEmail(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }
    }
}
