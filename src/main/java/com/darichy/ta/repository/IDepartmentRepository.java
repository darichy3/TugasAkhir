package com.darichy.ta.repository;

import com.darichy.ta.entity.Department;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.PagingAndSortingRepository;

import javax.persistence.QueryHint;
import org.springframework.stereotype.Repository;

/**
 * Spring JPA repository object interface untuk mendapatkan data dari table Department.
 *
 * @author Darichy3
 * @since 26/08/2015, modified: 01/09/2015 16:53
 */
@Repository
public interface IDepartmentRepository extends PagingAndSortingRepository<Department, Integer>
{
    /**
     * Menampilkan daftar departemen.
     *
     * @param sort Sorting method
     * @return The slice collection or data-paging collection of Department entity.
     */
    @QueryHints(value = {@QueryHint(name = "org.hibernate.cacheable", value = "true")})
    Iterable<Department> findAll(Sort sort);

    /**
     * Menampilkan daftar departemen dan jumlah employee per-departemen.
     *
     * @param pageable Paging and sorting method
     * @return The slice collection or data-paging collection of Department entity.
     */
    @QueryHints(value = {@QueryHint(name = "org.hibernate.cacheable", value = "true")})
    @Query("SELECT new Department(d.deptId, d.deptName, d.description, COUNT(p.personId) AS numberOfPerson) " +
            "FROM Department d LEFT JOIN d.persons p GROUP BY d.deptId")
    Page<Department> listAllWithStats(Pageable pageable);

}
