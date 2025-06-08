<template>
  <div class="wrap">
    <div class="modal fade" id="create-customer" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="defaultModalLabel">Cliente nuevo</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger" v-if="errors">
              <ul>
                <li v-for="error in errors">{{ error[0] }}</li>
              </ul>
            </div>

            <form>
              <div class="row">

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">fingerprint</i>
                    </span>
                    <div class="form-line">
                      <input 
                        type="text" 
                        class="form-control date" 
                        placeholder="Número de documento" 
                        v-model="nro_documento"
                        @blur="fetchCustomerData"
                      >
                    </div>
                  </div>
                  <small class="text-muted">Ingrese Numero de dni</small>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">account_circle</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Nombre" v-model="customer.customer_name">
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">email</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Correo electrónico"
                        v-model="customer.email">
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">phone</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Teléfono" v-model="customer.phone">
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">map</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Dirección" v-model="customer.address" />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <br>
            <button @click="createCustomer" type="button" class="btn btn-success waves-effect">Guardar</button>
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Cancelar</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

export default {
  mixins: [mixin],

  data() {
    return {
      nro_documento: "", // Nuevo campo para el código
      customer: {
        customer_name: "",
        email: "",
        phone: "",
        address: ""
      },

      errors: null,
      loading: false // Para controlar el estado de carga
    };
  },

  methods: {

    async fetchCustomerData() {
      if (!this.nro_documento) return;
      
      this.loading = true;
      
      try {
        const response = await axios.get(base_url + `customer/api-data?codigo=${this.nro_documento}`);
        const { nombre, direccion } = response.data;

        // Autocompletar campos
        this.customer.customer_name = nombre || "";
        this.customer.address = direccion || "";

      } catch (err) {
        console.error("Error al consultar API:", err);
        this.showErrorAlert("No se pudo obtener datos del cliente. Verifique el código.");
      } finally {
        this.loading = false;
      }
    },

    createCustomer() {
      axios
        .post(base_url + "customer", this.customer)

        .then(response => {
          $("#create-customer").modal("hide");

          this.customer = {
            customer_name: "",
            email: "",
            phone: "",
            address: ""
          };
          this.errors = null;
          EventBus.$emit("customer-created", response.data);

          // this.showMessage(response.data);

          this.successALert(response.data);
        })
        .catch(err => {
          if (err.response) {
            this.errors = err.response.data.errors;
          }
        });
    }
  },

  // end of method section

  created() { }
};
</script>