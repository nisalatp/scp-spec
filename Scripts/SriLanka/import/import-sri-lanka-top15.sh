#!/bin/bash
# Import Top 15 Sri Lanka Forms
# Env variables: BASE_URL, ADMIN_TOKEN

API_URL="${BASE_URL:-http://localhost:8080}"
TENANT="LK"

echo "Starting Import for Sri Lanka Top 15 Forms..."
echo "Target: $API_URL"
echo "Tenant: $TENANT"

# Function to import a file
import_form() {
    file=$1
    echo "Importing $file..."
    ./cli forms:import -f "../packages/$file" -t "$TENANT"
}

# Import all 15 forms
import_form "01-birth-registration.forms.yaml"
import_form "02-death-registration.forms.yaml"
import_form "03-marriage-registration.forms.yaml"
import_form "04-nic-application-update.forms.yaml"
import_form "05-household-registration-census.forms.yaml"
import_form "06-income-employment-declaration.forms.yaml"
import_form "07-welfare-samurdhi-aswesuma.forms.yaml"
import_form "08-maternal-child-health-registration.forms.yaml"
import_form "09-disability-registration.forms.yaml"
import_form "10-chronic-illness-medical-assistance.forms.yaml"
import_form "11-school-enrollment-attendance.forms.yaml"
import_form "12-scholarship-student-assistance.forms.yaml"
import_form "13-housing-asset-declaration.forms.yaml"
import_form "14-disaster-environmental-damage-assessment.forms.yaml"
import_form "15-digital-access-connectivity-registration.forms.yaml"

echo "Import Complete. Please check server logs for verification."
