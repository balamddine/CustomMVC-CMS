//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Page
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Page()
        {
            this.PagesContents = new HashSet<PagesContent>();
            this.PagesGalleries = new HashSet<PagesGallery>();
        }
    
        public int Id { get; set; }
        public int ParentId { get; set; }
        public string Name { get; set; }
        public string Link { get; set; }
        public string FriendlyUrl { get; set; }
        public int PageContentID { get; set; }
        public int PageTemplateID { get; set; }
        public int MenuOrder { get; set; }
        public bool isHidden { get; set; }
        public bool isDeleted { get; set; }
        public bool isList { get; set; }
    
        public virtual PageTemplate PageTemplate { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PagesContent> PagesContents { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PagesGallery> PagesGalleries { get; set; }
    }
}
